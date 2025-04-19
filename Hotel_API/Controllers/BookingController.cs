using Application.DTOs;
using Application.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Hotel_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookingController : ControllerBase
    {
        private readonly IBookingService _bookingService;

        public BookingController(IBookingService bookingService)
        {
            _bookingService = bookingService;
        }
        [HttpPost("create-booking")]
        public async Task<ActionResult<BookingResponseDTO>> CreateBooking([FromBody] BookingDTO bookingDTO)
        {
            try
            {
                var bookingResponse = await _bookingService.CreateBooking(bookingDTO);

                return Ok(bookingResponse);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return StatusCode(500, $"Ocurrió un error al obtener las habitaciones: {ex.Message}");

            }

        }
    }
}
