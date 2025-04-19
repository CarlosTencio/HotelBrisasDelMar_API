using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.ValueObjects
{
    public class AvailabilityCriterion
    {
        public DateTime EntryDate { get; set; }
        public DateTime DepartureDate { get; set; }
        public int RoomTypeId { get; set;  }

        public AvailabilityCriterion(DateTime entryDate, DateTime departureDate, int roomTypeId)
        {
            EntryDate = entryDate;
            DepartureDate = departureDate;
            RoomTypeId = roomTypeId;
        }
    }

}
