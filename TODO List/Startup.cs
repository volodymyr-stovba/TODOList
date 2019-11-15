using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TODO_List.Startup))]
namespace TODO_List
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
