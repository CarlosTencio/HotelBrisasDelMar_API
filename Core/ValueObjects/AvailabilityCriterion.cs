using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.ValueObjects
{
    public class AvailabilityCriterion
    {
        public DateTime EntryDate { get; }
        public DateTime DepartureDate { get; }
        public int RoomTypeId { get; }

        public AvailabilityCriterion(DateTime entryDate, DateTime departureDate, int roomTypeId)
        {
            EntryDate = entryDate;
            DepartureDate = departureDate;
            RoomTypeId = roomTypeId;
        }
    }

}
