using Application.DTOs;
using Application.Interfaces;
using Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Services
{
    public class AdService : IAdService
    {

        private readonly IAdRepository _adRepository;

        public AdService(IAdRepository adRepository)
        {
            _adRepository = adRepository;
        }

        public async Task<List<AdMainDTO>> GetAllMainAdDto()
        {

            var adMain = await _adRepository.GetAllMainAd();
               
            return adMain.Select(ad => new AdMainDTO
            {
                AdID = ad.AdID,
                Name = ad.Name,
                Img = ad.Img,
                ImgUrl = ad.ImgUrl,
            }).ToList();


        }
    }
}
