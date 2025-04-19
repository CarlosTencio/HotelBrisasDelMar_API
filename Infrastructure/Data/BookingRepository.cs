using Azure;
using Core.Entities;
using Core.Interfaces;
using Core.ValueObjects;
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
    public class BookingRepository : IBookingRepository
    {
        private readonly AppDbContext _context;

        // connect the database
        public BookingRepository(AppDbContext context)
        {
            _context = context;
        }
        private SqlConnection CreateConnection()
        {
            var connectionString = _context.Database.GetConnectionString();
            return new SqlConnection(connectionString);
        }
        public async Task<BookingResponse> CreateBooking(Booking booking)
        {


            using (var connection=CreateConnection()) {
                var parameters = new
                {
                    CustomerName = booking.Customer.CustomerName,
                    CustomerLastName = booking.Customer.CustomerLastName,
                    CustomerEmail = booking.Customer.CustomerEmail,
                    CardNumber = booking.Customer.CardNumber,
                    CheckIn = booking.CheckIn,
                    CheckOut = booking.CheckOut,                 
                    RoomID = booking.RoomID,
                    Transaction = booking.Transaction,//por ahora es el precio
                };

                var query = "sp_CreateBooking";

                var response= await connection.QueryAsync<BookingResponse>(
                    query,
                    parameters,
                    commandType: System.Data.CommandType.StoredProcedure
                );
                return response.First();
            }
            
        }
    }
}
