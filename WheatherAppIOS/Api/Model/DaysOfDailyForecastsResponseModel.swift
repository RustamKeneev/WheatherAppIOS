
import Foundation

class DaysOfDailyForecastsResponseModel: Codable {
    let headline: Headline?
    let dailyForecasts: [DailyForecast]?

    enum CodingKeys: String, CodingKey {
        case headline = "Headline"
        case dailyForecasts = "DailyForecasts"
    }

    init(headline: Headline?, dailyForecasts: [DailyForecast]?) {
        self.headline = headline
        self.dailyForecasts = dailyForecasts
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.dailyForecastTask(with: url) { dailyForecast, response, error in
//     if let dailyForecast = dailyForecast {
//       ...
//     }
//   }
//   task.resume()

// MARK: - DailyForecast
class DailyForecast: Codable {
    let date: String?
    let epochDate: Int?
    let sun: Sun?
    let moon: Moon?
    let temperature, realFeelTemperature, realFeelTemperatureShade: RealFeelTemperature?
    let hoursOfSun: Double?
    let degreeDaySummary: DegreeDaySummary?
    let airAndPollen: [AirAndPollen]?
    let day, night: Day?
    let sources: [String]?
    let mobileLink, link: String?

    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case epochDate = "EpochDate"
        case sun = "Sun"
        case moon = "Moon"
        case temperature = "Temperature"
        case realFeelTemperature = "RealFeelTemperature"
        case realFeelTemperatureShade = "RealFeelTemperatureShade"
        case hoursOfSun = "HoursOfSun"
        case degreeDaySummary = "DegreeDaySummary"
        case airAndPollen = "AirAndPollen"
        case day = "Day"
        case night = "Night"
        case sources = "Sources"
        case mobileLink = "MobileLink"
        case link = "Link"
    }

    init(date: String?, epochDate: Int?, sun: Sun?, moon: Moon?, temperature: RealFeelTemperature?, realFeelTemperature: RealFeelTemperature?, realFeelTemperatureShade: RealFeelTemperature?, hoursOfSun: Double?, degreeDaySummary: DegreeDaySummary?, airAndPollen: [AirAndPollen]?, day: Day?, night: Day?, sources: [String]?, mobileLink: String?, link: String?) {
        self.date = date
        self.epochDate = epochDate
        self.sun = sun
        self.moon = moon
        self.temperature = temperature
        self.realFeelTemperature = realFeelTemperature
        self.realFeelTemperatureShade = realFeelTemperatureShade
        self.hoursOfSun = hoursOfSun
        self.degreeDaySummary = degreeDaySummary
        self.airAndPollen = airAndPollen
        self.day = day
        self.night = night
        self.sources = sources
        self.mobileLink = mobileLink
        self.link = link
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.airAndPollenTask(with: url) { airAndPollen, response, error in
//     if let airAndPollen = airAndPollen {
//       ...
//     }
//   }
//   task.resume()

// MARK: - AirAndPollen
class AirAndPollen: Codable {
    let name: String?
    let value: Int?
    let category: String?
    let categoryValue: Int?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case value = "Value"
        case category = "Category"
        case categoryValue = "CategoryValue"
        case type = "Type"
    }

    init(name: String?, value: Int?, category: String?, categoryValue: Int?, type: String?) {
        self.name = name
        self.value = value
        self.category = category
        self.categoryValue = categoryValue
        self.type = type
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.dayTask(with: url) { day, response, error in
//     if let day = day {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Day
class Day: Codable {
    let icon: Int?
    let iconPhrase: String?
    let hasPrecipitation: Bool?
    let shortPhrase, longPhrase: String?
    let precipitationProbability, thunderstormProbability, rainProbability, snowProbability: Int?
    let iceProbability: Int?
    let wind, windGust: Wind?
    let totalLiquid, rain, snow, ice: Evapotranspiration?
    let hoursOfPrecipitation, hoursOfRain, hoursOfSnow, hoursOfIce: Int?
    let cloudCover: Int?
    let evapotranspiration, solarIrradiance: Evapotranspiration?

    enum CodingKeys: String, CodingKey {
        case icon = "Icon"
        case iconPhrase = "IconPhrase"
        case hasPrecipitation = "HasPrecipitation"
        case shortPhrase = "ShortPhrase"
        case longPhrase = "LongPhrase"
        case precipitationProbability = "PrecipitationProbability"
        case thunderstormProbability = "ThunderstormProbability"
        case rainProbability = "RainProbability"
        case snowProbability = "SnowProbability"
        case iceProbability = "IceProbability"
        case wind = "Wind"
        case windGust = "WindGust"
        case totalLiquid = "TotalLiquid"
        case rain = "Rain"
        case snow = "Snow"
        case ice = "Ice"
        case hoursOfPrecipitation = "HoursOfPrecipitation"
        case hoursOfRain = "HoursOfRain"
        case hoursOfSnow = "HoursOfSnow"
        case hoursOfIce = "HoursOfIce"
        case cloudCover = "CloudCover"
        case evapotranspiration = "Evapotranspiration"
        case solarIrradiance = "SolarIrradiance"
    }

    init(icon: Int?, iconPhrase: String?, hasPrecipitation: Bool?, shortPhrase: String?, longPhrase: String?, precipitationProbability: Int?, thunderstormProbability: Int?, rainProbability: Int?, snowProbability: Int?, iceProbability: Int?, wind: Wind?, windGust: Wind?, totalLiquid: Evapotranspiration?, rain: Evapotranspiration?, snow: Evapotranspiration?, ice: Evapotranspiration?, hoursOfPrecipitation: Int?, hoursOfRain: Int?, hoursOfSnow: Int?, hoursOfIce: Int?, cloudCover: Int?, evapotranspiration: Evapotranspiration?, solarIrradiance: Evapotranspiration?) {
        self.icon = icon
        self.iconPhrase = iconPhrase
        self.hasPrecipitation = hasPrecipitation
        self.shortPhrase = shortPhrase
        self.longPhrase = longPhrase
        self.precipitationProbability = precipitationProbability
        self.thunderstormProbability = thunderstormProbability
        self.rainProbability = rainProbability
        self.snowProbability = snowProbability
        self.iceProbability = iceProbability
        self.wind = wind
        self.windGust = windGust
        self.totalLiquid = totalLiquid
        self.rain = rain
        self.snow = snow
        self.ice = ice
        self.hoursOfPrecipitation = hoursOfPrecipitation
        self.hoursOfRain = hoursOfRain
        self.hoursOfSnow = hoursOfSnow
        self.hoursOfIce = hoursOfIce
        self.cloudCover = cloudCover
        self.evapotranspiration = evapotranspiration
        self.solarIrradiance = solarIrradiance
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.evapotranspirationTask(with: url) { evapotranspiration, response, error in
//     if let evapotranspiration = evapotranspiration {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Evapotranspiration
class Evapotranspiration: Codable {
    let value: Double?
    let unit: String?
    let unitType: Int?

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
    }

    init(value: Double?, unit: String?, unitType: Int?) {
        self.value = value
        self.unit = unit
        self.unitType = unitType
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.windTask(with: url) { wind, response, error in
//     if let wind = wind {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Wind
class Wind: Codable {
    let speed: Evapotranspiration?
    let direction: Direction?

    enum CodingKeys: String, CodingKey {
        case speed = "Speed"
        case direction = "Direction"
    }

    init(speed: Evapotranspiration?, direction: Direction?) {
        self.speed = speed
        self.direction = direction
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.directionTask(with: url) { direction, response, error in
//     if let direction = direction {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Direction
class Direction: Codable {
    let degrees: Int?
    let localized, english: String?

    enum CodingKeys: String, CodingKey {
        case degrees = "Degrees"
        case localized = "Localized"
        case english = "English"
    }

    init(degrees: Int?, localized: String?, english: String?) {
        self.degrees = degrees
        self.localized = localized
        self.english = english
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.degreeDaySummaryTask(with: url) { degreeDaySummary, response, error in
//     if let degreeDaySummary = degreeDaySummary {
//       ...
//     }
//   }
//   task.resume()

// MARK: - DegreeDaySummary
class DegreeDaySummary: Codable {
    let heating, cooling: Evapotranspiration?

    enum CodingKeys: String, CodingKey {
        case heating = "Heating"
        case cooling = "Cooling"
    }

    init(heating: Evapotranspiration?, cooling: Evapotranspiration?) {
        self.heating = heating
        self.cooling = cooling
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.moonTask(with: url) { moon, response, error in
//     if let moon = moon {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Moon
class Moon: Codable {
    let rise: Date?
    let epochRise: Int?
    let moonSet: Date?
    let epochSet: Int?
    let phase: String?
    let age: Int?

    enum CodingKeys: String, CodingKey {
        case rise = "Rise"
        case epochRise = "EpochRise"
        case moonSet = "Set"
        case epochSet = "EpochSet"
        case phase = "Phase"
        case age = "Age"
    }

    init(rise: Date?, epochRise: Int?, moonSet: Date?, epochSet: Int?, phase: String?, age: Int?) {
        self.rise = rise
        self.epochRise = epochRise
        self.moonSet = moonSet
        self.epochSet = epochSet
        self.phase = phase
        self.age = age
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.realFeelTemperatureTask(with: url) { realFeelTemperature, response, error in
//     if let realFeelTemperature = realFeelTemperature {
//       ...
//     }
//   }
//   task.resume()

// MARK: - RealFeelTemperature
class RealFeelTemperature: Codable {
    let minimum, maximum: Evapotranspiration?

    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
    }

    init(minimum: Evapotranspiration?, maximum: Evapotranspiration?) {
        self.minimum = minimum
        self.maximum = maximum
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.sunTask(with: url) { sun, response, error in
//     if let sun = sun {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Sun
class Sun: Codable {
    let rise: Date?
    let epochRise: Int?
    let sunSet: Date?
    let epochSet: Int?

    enum CodingKeys: String, CodingKey {
        case rise = "Rise"
        case epochRise = "EpochRise"
        case sunSet = "Set"
        case epochSet = "EpochSet"
    }

    init(rise: Date?, epochRise: Int?, sunSet: Date?, epochSet: Int?) {
        self.rise = rise
        self.epochRise = epochRise
        self.sunSet = sunSet
        self.epochSet = epochSet
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.headlineTask(with: url) { headline, response, error in
//     if let headline = headline {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Headline
class Headline: Codable {
    let effectiveDate: String?
    let effectiveEpochDate, severity: Int?
    let text, category: String?
    let endDate, endEpochDate: JSONNull?
    let mobileLink, link: String?

    enum CodingKeys: String, CodingKey {
        case effectiveDate = "EffectiveDate"
        case effectiveEpochDate = "EffectiveEpochDate"
        case severity = "Severity"
        case text = "Text"
        case category = "Category"
        case endDate = "EndDate"
        case endEpochDate = "EndEpochDate"
        case mobileLink = "MobileLink"
        case link = "Link"
    }

    init(effectiveDate: String?, effectiveEpochDate: Int?, severity: Int?, text: String?, category: String?, endDate: JSONNull?, endEpochDate: JSONNull?, mobileLink: String?, link: String?) {
        self.effectiveDate = effectiveDate
        self.effectiveEpochDate = effectiveEpochDate
        self.severity = severity
        self.text = text
        self.category = category
        self.endDate = endDate
        self.endEpochDate = endEpochDate
        self.mobileLink = mobileLink
        self.link = link
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers


// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
