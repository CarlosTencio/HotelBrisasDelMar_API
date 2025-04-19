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


    }


}
