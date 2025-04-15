using Application.DTOs;
using Application.Interfaces;
using Application.Services;
using Microsoft.AspNetCore.Mvc;

namespace Hotel_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomTypeController:ControllerBase 
    {
        private readonly IRoomTypeService _roomTypeService;
        public RoomTypeController(IRoomTypeService roomTypeService)
        {
            _roomTypeService = roomTypeService;
        }
        [HttpGet]
        public async Task<IActionResult> GetRoomType() {
            try
            {
                var roomTypes = await _roomTypeService.GetAllRoomType();
                return Ok(roomTypes);
            }
            catch(Exception ex) {
             return StatusCode(500, $"Ocurrió un error al obtener las páginas: {ex.Message}");

            }
        }

        [HttpGet]
        [Route("getRoomRatePage")]
        public async Task<ActionResult> getRoomRatePage()
        {
            try
            {
                var pages = await _roomTypeService.GetRoomRatePage();
                return Ok(pages);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return StatusCode(500, $"Ocurrió un error al obtener las páginas: {ex.Message}");
            }
        }

    }
}
