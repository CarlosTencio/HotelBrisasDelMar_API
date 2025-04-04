using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Entities
{
    public class Season
    {
        public int SeasonID { get; set; }
        public string SeasonName { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int Percent { get; set; }
        public bool IsActive { get; set; }
        public bool IsHigh { get; set; }

    }
}
