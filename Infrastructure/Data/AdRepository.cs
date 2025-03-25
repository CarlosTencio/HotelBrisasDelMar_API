using Core.Entities;
using Core.Interfaces;
using Dapper;
using Infrastructure.Persistence;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Data
{
    public class AdRepository : IAdRepository
    {

        private readonly AppDbContext _context;

        public AdRepository(AppDbContext context)
        {
            _context = context;
        }

        //connect the database
        private SqlConnection CreateConnection()
        {
            var connectionString = _context.Database.GetConnectionString();
            return new SqlConnection(connectionString);
        }

        //With this method, we can get all the ads that are always shown in the system
        public async Task<List<Ad>> GetAllMainAd()
        {
            using SqlConnection connection = CreateConnection();
            await connection.OpenAsync();

            var ads = await connection.QueryAsync<Ad>(
                "GetMainAds",
                commandType: CommandType.StoredProcedure
            );

            return ads.ToList();
        }
    }
}
