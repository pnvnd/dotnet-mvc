#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using dotnet_mvc.Controllers;

    public class MvcProjectContext : DbContext
    {
        public MvcProjectContext (DbContextOptions<MvcProjectContext> options)
            : base(options)
        {
        }

        public DbSet<dotnet_mvc.Controllers.Project> Project { get; set; }
    }
