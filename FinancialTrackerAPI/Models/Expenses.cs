namespace FinancialTrackerAPI.Models
{
    public class Expenses
    {
        public string name { get; set; } = string.Empty;
        public int amount;
        public string category { get; set; } = string.Empty;
        public string account { get; set; } = string.Empty;
        DateTime date { get; set; }
        public string description { get; set; } = string.Empty;
    }
}
