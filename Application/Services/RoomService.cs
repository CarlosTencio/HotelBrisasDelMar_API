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

        public async Task<AvailableRoomDTO?> CheckAvailabilty(AvailabilityCriterionDTO availabilityCriteriondto)
        {
            // Mapear el DTO al Value Object
            var criterion = new AvailabilityCriterion(
                availabilityCriteriondto.EntryDate,
                availabilityCriteriondto.DepartureDate,
                availabilityCriteriondto.RoomTypeId
            );

            var room = await _roomRepository.CheckAvailability(criterion);

            if (room == null)
                return null;

            return new AvailableRoomDTO
            {
                RoomNumber = room.RoomNumber,
                RoomId = room.RoomId,
                RoomTypeId = room.RoomTypeId,
                RoomTypeName = room.RoomTypeName,
                Description = room.Description,
                Price = room.Price,
                ImgUrl = room.ImgUrl,
                CheckIn=room.CheckIn,
                CheckOut=room.CheckOut,
                ResultType = room.ResultType
            };
        }

        public async Task<List<StatusRoomDTO?>> StatusRoom()
        {
            var rooms = await _roomRepository.GetAllHotelStatusRooms();

            return rooms.Select(room => new StatusRoomDTO
            {
                RoomNumber = room.RoomNumber,
                RoomTypeName = room.RoomTypeName,
                Status = room.Status
            }).ToList();
        }
    }
}
