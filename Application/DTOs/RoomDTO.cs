using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.DTOs
{
    public class RoomDTO
    {
        public string RoomType { get; set; }

        public bool IsActice { get; set; }

        public int RoomNumber { get; set; }
        public bool Status { get; set; }
    }
}
