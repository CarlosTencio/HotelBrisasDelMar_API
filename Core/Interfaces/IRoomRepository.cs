using Core.Entities;
using Core.ValueObjects;

namespace Core.Interfaces
{
    public interface IRoomRepository
    {
        Task<AvailabilityRoom?> CheckAvailability(AvailabilityCriterion availabilityCriterion);
    }
}
