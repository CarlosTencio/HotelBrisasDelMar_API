using Application.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces
{
    public interface IRoomTypeService
    {
        Task<List<RoomTypeDTO>> GetAllRoomType();
        Task<List<RoomTypeDTO>> GetRoomRatePage();
        Task<RoomTypeDTO?> GetRoomTypeByName(string roomTypeName);
    }
}
