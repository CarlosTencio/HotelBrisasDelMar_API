using Core.Entities;
using Core.ValueObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Interfaces
{
    public interface IRoomTypeRepository
    {
        Task<List<RoomType>> GetAllRoomType();
        Task<List<RoomType>> GetAllRoomTypeBySeason();
        Task<UpdateTypeRoomResult> UpdateRoomTypeData(RoomType roomType);
    }
}
