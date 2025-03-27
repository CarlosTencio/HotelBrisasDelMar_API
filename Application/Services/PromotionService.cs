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
    public class PromotionService : IPromotionService
    {
        private readonly IPromotionRepository _promotionRepository;

        public PromotionService(IPromotionRepository promotionRepository)
        {
            _promotionRepository = promotionRepository;
        }

        public async Task<List<PromotionMainDTO>> GetAllMainPromotionDto()
        {
            
            var promotions = await _promotionRepository.GetAllMainPromotion();

            return promotions.Select(promotion => new PromotionMainDTO
            {
                PromotionID = promotion.PromotionID,
                PromotionName = promotion.PromotionName,
                Img = promotion.Img,
            }).ToList();

        }
    }
}
