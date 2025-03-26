using Application.DTOs;
using Application.Interfaces;
using Core.Interfaces;

namespace Application.Services
{
    public class PageService : IPageService
    {

        private readonly IPageRepository _pageRepository;

        public PageService(IPageRepository pageRepository) { 
            _pageRepository= pageRepository;
        }
        // En el servicio (capa de aplicación)
        public async Task<List<PageDTO>> GetAllPagesWithImagesDto()
        {
            var pages = await _pageRepository.GetAllPagesWithImages();

            return pages.Select(p => new PageDTO
            {
                PageID = p.PageID,
                PageTitle = p.PageTitle,
                PageContent = p.PageContent,
                Images = p.PageImages.Select(pi => pi.Image.ImagePath).ToList()
            }).ToList();
        }

        public async Task<List<PageDTO>> GetOnePageWithImages(string facilities)
        {
            var pages = await _pageRepository.GetOnePageWithImages(facilities);

            return pages.Select(p => new PageDTO
            {
                PageID = p.PageID,
                PageTitle = p.PageTitle,
                PageContent = p.PageContent,
                Images = p.PageImages.Select(pi => pi.Image.ImagePath).ToList()
            }).ToList();
        }
    }
}
