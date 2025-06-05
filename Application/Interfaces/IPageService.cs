using Application.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces
{
    public interface IPageService
    {
        Task<List<PageDTO>> GetAllPagesWithImagesDto();
        Task<List<PageDTO>> GetOnePageWithImages(string facilities);
        Task<ResponseDto> DeleteFacility(int facilityId);
        Task<bool> UpdateFacility(int pageID, string pageContent, string imagePath);
        Task<bool> CreateFacility(string contentFacility, string imagePath);
    }
}
