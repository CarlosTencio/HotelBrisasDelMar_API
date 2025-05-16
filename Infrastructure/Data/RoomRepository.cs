using Core.Entities;
using Core.Interfaces;
using Core.ValueObjects;
using Dapper;
using Infrastructure.Persistence;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;


namespace Infrastructure.Data
{
    public class RoomRepository : IRoomRepository
    {
        private readonly AppDbContext _context;
    
        public RoomRepository(AppDbContext context)
        {
            _context = context;
        }

        //connect the database
        private SqlConnection CreateConnection()
        {
            var connectionString = _context.Database.GetConnectionString();
            return new SqlConnection(connectionString);

        }


        public async Task<AvailabilityRoom?> CheckAvailability(AvailabilityCriterion availabilityCriterion)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new
                {
                    StartTime = availabilityCriterion.EntryDate,
                    EndTime = availabilityCriterion.DepartureDate,
                    RoomType = availabilityCriterion.RoomTypeId,
                };

                var query = "sp_check_availability";

                // Ejecutamos la consulta y obtenemos una lista de AvailabilityRoom(un value object)
                var rooms = await connection.QueryAsync<AvailabilityRoom>(
                    query,
                    parameters,
                    commandType: System.Data.CommandType.StoredProcedure
                );

                // Si la lista está vacía, retornamos null; sino, retornamos el primer elemento
                return rooms.FirstOrDefault();
            }
        }


        public async Task UpdateRoomStatus(int roomId)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new { roomId = roomId };
                var query = "sp_enable_room";

                await connection.ExecuteAsync(
                    query,
                    parameters,
                    commandType: System.Data.CommandType.StoredProcedure
                );
            }

        public async Task<List<StatusRoom>> GetAllHotelStatusRooms()
        {
            using SqlConnection connection = CreateConnection();

            await connection.OpenAsync();

            var rooms = await connection.QueryAsync<StatusRoom>(
                "sp_getHotelRoomStatusToday",
                commandType: System.Data.CommandType.StoredProcedure
            );

            return rooms.ToList();
        }
    }


}
