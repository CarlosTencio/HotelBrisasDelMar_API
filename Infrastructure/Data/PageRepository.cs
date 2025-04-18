﻿using Core.Entities;
using Core.Interfaces;
using Dapper;
using Infrastructure.Persistence;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

using System.Data;

namespace Infrastructure.Data
{
    public class PageRepository : IPageRepository
    {
        private readonly AppDbContext _context;

        public PageRepository(AppDbContext context)
        {
            _context = context;
        }
        //with this methos, we connect to the database
        private SqlConnection CreateConnection()
        {
            var connectionString = _context.Database.GetConnectionString();
            return new SqlConnection(connectionString);
        }
        //With this method, we can get all the pages from the database
        // En el repositorio (capa de infraestructura)
        public async Task<List<Page>> GetAllPagesWithImages()
        {
            using SqlConnection connection = CreateConnection();
            await connection.OpenAsync();

            var pageDictionary = new Dictionary<int, Page>();

            await connection.QueryAsync<Page, Image, Page>(
                "GetPagesWithImages",
                (page, image) =>
                {
                    if (!pageDictionary.TryGetValue(page.PageID, out var existingPage))
                    {
                        existingPage = page;
                        existingPage.PageImages = new List<PageImage>();
                        pageDictionary.Add(existingPage.PageID, existingPage);
                    }

                    if (image != null && image.ImagePath != null)
                    {
                        existingPage.PageImages.Add(new PageImage
                        {
                            PageID = page.PageID,
                            Page = existingPage,
                            ImageID = image.PageImageID,
                            Image = image
                        });
                    }

                    return existingPage;
                },
                splitOn: "ImagePath",  // Ajusta según tu esquema real
                commandType: CommandType.StoredProcedure
            );

            return pageDictionary.Values.ToList();
        }

        public async Task<List<Page>> GetOnePageWithImages(string facilities)
        {
            using SqlConnection connection = CreateConnection();
            await connection.OpenAsync();

            var pageDictionary = new Dictionary<int, Page>();

                        await connection.QueryAsync<Page, Image, Page>(
                 "sp_get_facilities",
                 (page, image) =>
                 {
                     if (!pageDictionary.TryGetValue(page.PageID, out var existingPage))
                     {
                         existingPage = page;
                         existingPage.PageImages = new List<PageImage>();
                         pageDictionary.Add(existingPage.PageID, existingPage);
                     }

                     if (image != null && !string.IsNullOrEmpty(image.ImagePath))
                     {
                         existingPage.PageImages.Add(new PageImage
                         {
                             PageID = page.PageID,
                             Page = existingPage,
                             ImageID = image.PageImageID,
                             Image = image
                         });
                     }

                     return existingPage;
                 },
                 param: new { PageTitle = facilities },
                 splitOn: "ImagePath",
                 commandType: CommandType.StoredProcedure
             );
            return pageDictionary.Values.ToList();
        }
    }
}
