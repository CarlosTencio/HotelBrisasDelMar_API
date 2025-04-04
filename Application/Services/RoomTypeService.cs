﻿using Application.DTOs;
using Application.Interfaces;
using Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Services
{
    public class RoomTypeService : IRoomTypeService
    {
        private readonly IRoomTypeRepository _roomTypeRepository;
        public RoomTypeService(IRoomTypeRepository roomTypeRepository)
        {
            _roomTypeRepository = roomTypeRepository;
        }

        public async Task<List<RoomTypeDTO>> GetAllRoomType()
        {
           var roomTypes = await _roomTypeRepository.GetAllRoomType();
           return roomTypes.Select(r=> new RoomTypeDTO
           {
               RoomTypeName = r.RoomTypeName,
               Characteristics = r.Characteristics,
               description = r.description,
               Price = r.Price

           }).ToList();

        }
    }
}
