using Microsoft.AspNetCore.Mvc;

namespace CatsApi.Controllers;

[ApiController]
[Route("/")]
public class RootController : ControllerBase
{

    private readonly ILogger<RootController> _logger;

    public RootController(ILogger<RootController> logger)
    {
        _logger = logger;
    }

    [HttpGet("Ping", Name = nameof(Ping))]
    public IActionResult Ping()
    {
        return Ok(new { Message = "Pong" });
    }
}