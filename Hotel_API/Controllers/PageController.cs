using Application.DTOs;
using Application.Interfaces;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Hotel_API.Controllers
{

    [Route("api/[controller]")]
    [ApiController]

    public class PageController : ControllerBase
    {
        private readonly IPageService _pageService;
        public PageController(IPageService pageService)
        {
            _pageService = pageService;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PageDTO>>> GetPages()
        {
            try
            {
                var pages = await _pageService.GetAllPagesWithImagesDto();
                return Ok(pages);

            }
            catch (Exception ex)
            {
                // Loguear el error (si tienes un sistema de logging, como Serilog, NLog, etc.)
                // Si no tienes un sistema de logs, puedes usar simplemente:
                Console.WriteLine(ex.Message);
                return StatusCode(500, $"Ocurrió un error al obtener las páginas: {ex.Message}");
            }

        }
        [HttpGet]
        [Route("getPageForTittle")]
        public async Task<ActionResult<IEnumerable<PageDTO>>> getPageForTittle(string facilities)
        {
            try
            {
                var pages = await _pageService.GetOnePageWithImages(facilities);
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
