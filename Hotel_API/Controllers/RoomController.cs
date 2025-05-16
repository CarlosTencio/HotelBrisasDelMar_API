using Application.DTOs;
using Application.Interfaces;
using Core.ValueObjects;
using Microsoft.AspNetCore.Mvc;

namespace Hotel_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class RoomController: ControllerBase
    {
        private readonly IRoomService _roomService;
        public RoomController(IRoomService roomService)
        {
            _roomService = roomService;
        }
        [HttpPost("check-availability")]
        public async Task<ActionResult<AvailableRoomDTO?>> checkAvailability([FromBody] AvailabilityCriterionDTO availabilityCriterion)
        {
            try
            {
                var result = await _roomService.CheckAvailabilty(availabilityCriterion);

                if (result == null)
                    return Ok();

                return Ok(result);
            }
            catch (ArgumentException ex) // Esto captura lo lanzado por el ValueObject
            {
                return BadRequest(new { error = ex.Message }); // Retorna 400 con el mensaje del dominio
            }
            catch (Exception ex)
            {
                // Log o debug si querés: Console.WriteLine(ex);
                return StatusCode(500, new { error = "Ocurrió un error al verificar disponibilidad." });
            }
        }

        [HttpPut("room-status/{id}")]
        public async Task<ActionResult> UpdateRoomStatus(int id)
        {
            try
            {
                await _roomService.UpdateRoomStatus(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = "Ocurrió un error al actualizar el estado de la habitación." });
            }
        }

        [HttpGet("status-room")]
        public async Task<ActionResult<List<StatusRoomDTO?>>> StatusRoom()
        {
            try
            {
                var rooms = await _roomService.StatusRoom();
                return Ok(rooms);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return StatusCode(500, $"Ocurrió un error al obtener el estado de las habitaciones: {ex.Message}");
            }
        }
    }
}
