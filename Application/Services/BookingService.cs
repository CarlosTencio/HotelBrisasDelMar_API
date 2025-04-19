using Application.DTOs;
using Application.Interfaces;
using Core.Entities;
using Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Services
{
    public class BookingService : IBookingService
    {
        private readonly IBookingRepository _bookingRepository;
        public BookingService(IBookingRepository bookingRepository)
        {
            _bookingRepository = bookingRepository;
        }
        public async Task<BookingResponseDTO> CreateBooking(BookingDTO bookingDTO)
        {
            var customer=new Customer(
                bookingDTO.Customer.Name,
                bookingDTO.Customer.LastName,
                bookingDTO.Customer.Email,
                bookingDTO.Customer.CardNumber
            );

            var booking = new Booking(
                customer,
                bookingDTO.RoomId,
                bookingDTO.CheckIn,
                bookingDTO.CheckOut,
                bookingDTO.Transaction
            );
            var ResponseBooking = await _bookingRepository.CreateBooking(booking);
            return new BookingResponseDTO
            {
                Status = ResponseBooking.Status,
                BookingReference = ResponseBooking.BookingReference,
                Name = ResponseBooking.Name,
                LastName = ResponseBooking.LastName,
                Email = ResponseBooking.Email

            };
        }


    }
}
