using Application.DTOs;
using Application.Interfaces;
using Core.Interfaces;
using Core.ValueObjects;
using System.Linq;

namespace Application.Services
{
    public class RoomService : IRoomService
    {
        private readonly IRoomRepository _roomRepository;

        public RoomService(IRoomRepository roomRepository)
        {
            _roomRepository = roomRepository;
        }

        public async Task<AvailableRoomDTO?> CheckAvailabilty(AvailabilityCriterion availabilityCriterion)
        {
            var room = await _roomRepository.CheckAvailability(availabilityCriterion);

            if (room == null)
                return null;

            return new AvailableRoomDTO
            {
                RoomNumber = room.RoomNumber,
                RoomTypeId = room.RoomTypeId,
                RoomTypeName = room.RoomTypeName,
                Description = room.Description
            };
        }

    }
}
