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

                var room = await _roomService.CheckAvailabilty(availabilityCriterion);

                if (room == null)
                    return Ok();

                return Ok(room);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return StatusCode(500, $"Ocurrió un error al obtener las habitaciones: {ex.Message}");
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
