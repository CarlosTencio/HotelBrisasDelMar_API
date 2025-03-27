using Application.DTOs;
using Application.Interfaces;
using Application.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Hotel_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PromotionController : ControllerBase
    {

        private readonly IPromotionService _promotionService;

        public PromotionController(IPromotionService promotionService)
        {
            _promotionService = promotionService;
        }

        [HttpGet]
        public async Task<ActionResult<List<PromotionMainDTO>>> GetAllMainPromotionDto()
        {
            try
            {
                var promotions = await _promotionService.GetAllMainPromotionDto();
                return Ok(promotions);

            }
            catch (Exception ex)
            {
                // Loguear el error (si tienes un sistema de logging, como Serilog, NLog, etc.)
                // Si no tienes un sistema de logs, puedes usar simplemente:
                Console.WriteLine(ex.Message);
                return StatusCode(500, $"Ocurrió un error al obtener las promociones: {ex.Message}");
            }
        }

    }
}
