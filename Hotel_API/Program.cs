

using Application.Interfaces;
using Application.Services;
using Core.Interfaces;
using Infrastructure.Data;
using Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Registrar el DbContext con la cadena de conexi?n
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Registrar el repositorio(sistema de inyección de dependencias)
builder.Services.AddScoped<IPageRepository, PageRepository>();
// Registrar servicios que usan esos repositorios
builder.Services.AddScoped<IPageService, PageService>();


// Configurar Swagger
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Agregar controladores
builder.Services.AddControllers();

var app = builder.Build();


// Configurar Swagger en entorno de desarrollo
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// Configurar middleware
app.UseAuthorization();
app.MapControllers();
app.Run();
