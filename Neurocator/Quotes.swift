import Foundation

class QuotesManager {
    private let quotes: [String] = [
        "“Believe you can and you’re halfway there.” – Theodore Roosevelt",
        "“Gratitude turns what we have into enough.” – Aesop",
        "“The only way to do great work is to love what you do.” – Steve Jobs",
        "“Appreciation can make a day, even change a life. Your willingness to put it into words is all that is necessary.” – Margaret Cousins",
        "“You are never too old to set another goal or to dream a new dream.” – C.S. Lewis",
        "“Gratitude is not only the greatest of virtues but the parent of all others.” – Cicero",
        "“Don’t watch the clock; do what it does. Keep going.” – Sam Levenson",
        "“Thank you for being a rainbow in my cloud.” – Maya Angelou",
        "“The future belongs to those who believe in the beauty of their dreams.” – Eleanor Roosevelt",
        "“Feeling gratitude and not expressing it is like wrapping a present and not giving it.” – William Arthur Ward",
        "“It always seems impossible until it’s done.” – Nelson Mandela",
        "“Appreciation is a wonderful thing. It makes what is excellent in others belong to us as well.” – Voltaire",
        "“Success is not final, failure is not fatal: It is the courage to continue that counts.” – Winston Churchill",
        "“The roots of all goodness lie in the soil of appreciation for goodness.” – Dalai Lama",
        "“You are braver than you believe, stronger than you seem, and smarter than you think.” – A.A. Milne",
        "“When we focus on our gratitude, the tide of disappointment goes out, and the tide of love rushes in.” – Kristin Armstrong",
        "“The only limit to our realization of tomorrow is our doubts of today.” – Franklin D. Roosevelt",
        "“As we express our gratitude, we must never forget that the highest appreciation is not to utter words, but to live by them.” – John F. Kennedy",
        "“Your time is limited, so don’t waste it living someone else’s life.” – Steve Jobs",
        "“To the world, you may be one person, but to one person you may be the world.” – Dr. Seuss",
        "“Start where you are. Use what you have. Do what you can.” – Arthur Ashe",
        "“Gratitude makes sense of our past, brings peace for today, and creates a vision for tomorrow.” – Melody Beattie",
        "“What lies behind us and what lies before us are tiny matters compared to what lies within us.” – Ralph Waldo Emerson",
        "“In ordinary life, we hardly realize that we receive a great deal more than we give, and that it is only with gratitude that life becomes rich.” – Dietrich Bonhoeffer",
        "“Success usually comes to those who are too busy to be looking for it.” – Henry David Thoreau",
        "“Gratitude unlocks the fullness of life. It turns what we have into enough, and more.” – Melody Beattie"
    ]
    
    private var previousQuote: String? = nil
    
    func getRandomQuote() -> String {
        var newQuote: String
        repeat {
            newQuote = quotes.randomElement()!
        } while newQuote == previousQuote
        
        previousQuote = newQuote
        return newQuote
    }
}
