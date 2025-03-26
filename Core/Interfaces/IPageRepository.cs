﻿using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Interfaces
{
    public interface IPageRepository
    {
        Task<List<Page>> GetAllPagesWithImages();
        Task<List<Page>> GetOnePageWithImages(string facilities);
    }
}
