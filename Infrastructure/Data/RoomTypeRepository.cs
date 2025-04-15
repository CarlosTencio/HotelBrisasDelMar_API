using Core.Entities;
using Core.Interfaces;
using Dapper;
using Infrastructure.Persistence;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Data
{
    public class RoomTypeRepository : IRoomTypeRepository
    {
        private readonly AppDbContext _context;

        public RoomTypeRepository(AppDbContext context)
        {
            _context = context;
        }
        //connect the database
        private SqlConnection CreateConnection()
        {
            var connectionString = _context.Database.GetConnectionString();
            return new SqlConnection(connectionString);

        }
        public async Task<List<RoomType>> GetAllRoomType()
        {
            using SqlConnection connection = CreateConnection();
            await connection.OpenAsync();
            
            var roomTypes = await connection.QueryAsync<RoomType>(
                "sp_get_all_RoomType",
                commandType: System.Data.CommandType.StoredProcedure
            );
            return roomTypes.ToList();
        }

        public async Task<List<RoomType>> GetAllRoomTypeBySeason()
        {
            using SqlConnection connection = CreateConnection();
            await connection.OpenAsync();

            var roomTypes = await connection.QueryAsync<RoomType>(
                "sp_get_RoomType_season",
                commandType: System.Data.CommandType.StoredProcedure
            );
            return roomTypes.ToList();
        }
    }
}
