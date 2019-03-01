//
//  Exoplanets.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.19.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation

//{
//    "count": 4080,
//    "next": "https://api.arcsecond.io/exoplanets/?page=2",
//    "previous": null,
//    "results": [
//    {
//    "name": "11 Com b",
//    "coordinates": {
//    "system": "ICRS",
//    "right_ascension": 185.1791667,
//    "right_ascension_units": "degrees",
//    "declination": 17.7927778,
//    "declination_units": "degrees",
//    "epoch": 2451545
//    },
//    "mass": {
//    "value": 19.4,
//    "unit": "M_jup",
//    "error_max": 1.5,
//    "error_min": 1.5,
//    "bibcode": ""
//    },
//    "radius": null,
//    "inclination": null,
//    "semi_major_axis": {
//    "value": 1.29,
//    "unit": "AU",
//    "error_max": 0.05,
//    "error_min": 0.05,
//    "bibcode": ""
//    },
//    "orbital_period": {
//    "value": 326.03,
//    "unit": "days",
//    "error_max": 0.32,
//    "error_min": 0.32,
//    "bibcode": ""
//    },
//    "eccentricity": {
//    "value": 0.231,
//    "error_max": 0.005,
//    "error_min": 0.005,
//    "bibcode": ""
//    },
//    "omega_angle": {
//    "value": 94.8,
//    "unit": "º",
//    "error_max": 1.5,
//    "error_min": 1.5,
//    "bibcode": ""
//    },
//    "anomaly_angle": null,
//    "lambda_angle": null,
//    "time_periastron": {
//    "value": 2452899.6,
//    "error_max": 1.6,
//    "error_min": 1.6,
//    "bibcode": ""
//    },
//    "time_conjonction": null,
//    "angular_distance": null,
//    "tzero_primary_transit": null,
//    "tzero_secondary_transit": null,
//    "impact_parameter": null,
//    "tzero_radial_velocity": null,
//    "velocity_semiamplitude": {
//    "value": 296.7,
//    "unit": "m/s",
//    "error_max": 5.6,
//    "error_min": 5.6,
//    "bibcode": ""
//    },
//    "calculated_temperature": null,
//    "measured_temperature": null,
//    "hottest_point_longitude": null,
//    "geometric_albedo": null,
//    "surface_gravity": null,
//    "detection_method": "Radial Velocity",
//    "mass_detection_method": "Radial Velocity",
//    "radius_detection_method": "Radial Velocity",
//    "parent_star": "11 Com"
//    },

struct Coordinates : Decodable {
    let system: String?
    let right_ascension: Double?
    let right_ascension_units: String?
    let declination: Double?
    let declination_units: String?
    let epoch: Int? //2451545
    
    init () {
        system = ""
        right_ascension =  -1.0
        right_ascension_units = ""
        declination = -1.0
        declination_units = ""
        epoch = 0
    }
    
    func printInfo() -> String? {
        let unwrap = Unwraping()
        let text = """
        \tSystem: \(unwrap.unwrapString(value: system))
        \tRight Ascension: \(unwrap.unwrapDouble(value: right_ascension))
        \tRight Ascension Units: \(unwrap.unwrapString(value: right_ascension_units))
        \tDeclination: \(unwrap.unwrapDouble(value: declination))
        \tDeclination Units: \(unwrap.unwrapString(value: declination_units))
        \tEpoch: \(unwrap.unwrapInt(value: epoch))
        """
        return text
    }
    
}

struct Mass : Decodable {
    let value: Double? //19.4,
    let unit: String? //"M_jup",
    let error_max: Double? //1.5,
    let error_min: Double? // 1.5,
    let bibcode: String? //""
    
    init () {
        value = -1.0 //19.4,
        unit = "" //"M_jup",
        error_max = -1.0 //1.5,
        error_min = -1.0 // 1.5,
        bibcode = "" //""
    }
    
    func printInfo() -> String? {
        let unwrap = Unwraping()
        let text = """
        \tValue: \(unwrap.unwrapDouble(value: value))
        \tUnit: \(unwrap.unwrapString(value: unit))
        \tError Max: \(unwrap.unwrapDouble(value: error_max))
        \tError Min: \(unwrap.unwrapDouble(value: error_min))
        \tBibcode: \(unwrap.unwrapString(value: bibcode))
        """
        return text
    }
    
}

struct Radius : Decodable {
    let value: Double? //0.000002,
    let unit: String? //"R_jup",
    let error_max: Double? //null,
    let error_min: Double? //null,
    let bibcode: String? //""
    
    init () {
        value = -1.0 //0.000002,
        unit = "" //"R_jup",
        error_max = -1.0 //null,
        error_min = -1.0 //null,
        bibcode = "" //""
    }
    
    func printInfo() -> String? {
        let unwrap = Unwraping()
        let text = """
        \tValue: \(unwrap.unwrapDouble(value: value))
        \tUnit: \(unwrap.unwrapString(value: unit))
        \tError Max: \(unwrap.unwrapDouble(value: error_max))
        \tError Min: \(unwrap.unwrapDouble(value: error_min))
        \tBibcode: \(unwrap.unwrapString(value: bibcode))
        """
        return text
    }

}

struct Inclination : Decodable {
    let value: Double? //138.2,
    let unit: String? //"º",
    let error_max: Double? //0.5,
    let error_min: Double? //0.5,
    let bibcode: String? //""
    
    
    init () {
        value = -1.0 //138.2,
        unit = "" //"º",
        error_max = -1.0 //0.5,
        error_min = -1.0 //0.5,
        bibcode = "" //""
    }
    
    func printInfo() -> String? {
        let unwrap = Unwraping()
        let text = """
        \tValue: \(unwrap.unwrapDouble(value: value))
        \tUnit: \(unwrap.unwrapString(value: unit))
        \tError Max: \(unwrap.unwrapDouble(value: error_max))
        \tError Min: \(unwrap.unwrapDouble(value: error_min))
        \tBibcode: \(unwrap.unwrapString(value: bibcode))
        """
        return text
    }

}

struct Semi_Major_Axis : Decodable {
    let value: Double? //1.29,
    let unit: String? //"AU",
    let error_max: Double? //0.05,
    let error_min: Double? //0.05,
    let bibcode: String? //""
    
    init () {
        value = -1.0 //1.29,
        unit = "" //"AU",
        error_max = -1.0 //0.05,
        error_min = -1.0 //0.05,
        bibcode = "" //""
    }
    
    func printInfo() -> String? {
        let unwrap = Unwraping()
        let text = """
        \tValue: \(unwrap.unwrapDouble(value: value))
        \tUnit: \(unwrap.unwrapString(value: unit))
        \tError Max: \(unwrap.unwrapDouble(value: error_max))
        \tError Min: \(unwrap.unwrapDouble(value: error_min))
        \tBibcode: \(unwrap.unwrapString(value: bibcode))
        """
        return text
    }

}

struct Orbital_Period : Decodable {
    let value: Double? //326.03,
    let unit: String? //"days",
    let error_max: Double? //0.32,
    let error_min: Double? //0.32,
    let bibcode: String? //""
    
    init () {
        value = -1.0 //326.03,
        unit = "" //"days",
        error_max = -1.0 //0.32,
        error_min = -1.0 //0.32,
        bibcode = "" //""
    }
    
    func printInfo() -> String? {
        let unwrap = Unwraping()
        let text = """
        \tValue: \(unwrap.unwrapDouble(value: value))
        \tUnit: \(unwrap.unwrapString(value: unit))
        \tError Max: \(unwrap.unwrapDouble(value: error_max))
        \tError Min: \(unwrap.unwrapDouble(value: error_min))
        \tBibcode: \(unwrap.unwrapString(value: bibcode))
        """
        return text
    }

}

struct Eccentricity : Decodable {
    let value: Double? //0.231,
    let error_max: Double? //0.005,
    let error_min: Double? //0.005,
    let bibcode: String? //""
    
    init () {
        value = -1.0 //0.231,
        error_max = -1.0 //0.005,
        error_min = -1.0 //0.005,
        bibcode = "" //""
    }
    
    func printInfo() -> String? {
        let unwrap = Unwraping()
        let text = """
        \tValue: \(unwrap.unwrapDouble(value: value))
        \tError Max: \(unwrap.unwrapDouble(value: error_max))
        \tError Min: \(unwrap.unwrapDouble(value: error_min))
        \tBibcode: \(unwrap.unwrapString(value: bibcode))
        """
        return text
    }

}

struct Time_periastron : Decodable {
    let value: Double? //2452899.6,
    let error_max: Double? //1.6,
    let error_min: Double? //1.6,
    let bibcode: String? //""
    
    init () {
        value = -1.0 //0.231,
        error_max = -1.0 //0.005,
        error_min = -1.0 //0.005,
        bibcode = "" //""
    }
    
    func printInfo() -> String? {
        let unwrap = Unwraping()
        let text = """
        \tValue: \(unwrap.unwrapDouble(value: value))
        \tError Max: \(unwrap.unwrapDouble(value: error_max))
        \tError Min: \(unwrap.unwrapDouble(value: error_min))
        \tBibcode: \(unwrap.unwrapString(value: bibcode))
        """
        return text
    }

}

struct Velocity_semiamplitude : Decodable {
    let value: Double? //296.7,
    let unit: String? //"m/s",
    let error_max: Double? //5.6,
    let error_min: Double? //5.6,
    let bibcode: String? //""
    
    init () {
        value = -1.0 //0.231,
        unit = ""
        error_max = -1.0 //0.005,
        error_min = -1.0 //0.005,
        bibcode = "" //""
    }
    
    func printInfo() -> String? {
        let unwrap = Unwraping()
        let text = """
        \tValue: \(unwrap.unwrapDouble(value: value))
        \tUnit: \(unwrap.unwrapString(value: unit))
        \tError Max: \(unwrap.unwrapDouble(value: error_max))
        \tError Min: \(unwrap.unwrapDouble(value: error_min))
        \tBibcode: \(unwrap.unwrapString(value: bibcode))
        """
        return text
    }

}

struct Calculated_temperature : Decodable {
    let value: Double?
    let unit: String?
    let error_max: Double?
    let error_min: Double?
    let bibcode: String?
    
    init () {
        value = -1.0 //0.231,
        unit = ""
        error_max = -1.0 //0.005,
        error_min = -1.0 //0.005,
        bibcode = "" //""
    }
    
    func printInfo() -> String? {
        let unwrap = Unwraping()
        let text = """
        \tValue: \(unwrap.unwrapDouble(value: value))
        \tUnit: \(unwrap.unwrapString(value: unit))
        \tError Max: \(unwrap.unwrapDouble(value: error_max))
        \tError Min: \(unwrap.unwrapDouble(value: error_min))
        \tBibcode: \(unwrap.unwrapString(value: bibcode))
        """
        return text
    }

}

struct Geometric_albedo : Decodable {
    let value: Double?
    let error_max: Double?
    let error_min: Double?
    let bibcode: String?
    
    init () {
        value = -1.0 //0.231,
        error_max = -1.0 //0.005,
        error_min = -1.0 //0.005,
        bibcode = "" //""
    }
    
    func printInfo() -> String? {
        let unwrap = Unwraping()
        let text = """
        \tValue: \(unwrap.unwrapDouble(value: value))
        \tError Max: \(unwrap.unwrapDouble(value: error_max))
        \tError Min: \(unwrap.unwrapDouble(value: error_min))
        \tBibcode: \(unwrap.unwrapString(value: bibcode))
        """
        return text
    }

}

struct Surface_gravity : Decodable {
    let value: Double?
    let unit: String?
    let error_max: Double?
    let error_min: Double?
    let bibcode: String?
    
    init () {
        value = -1.0 //0.231,
        unit = ""
        error_max = -1.0 //0.005,
        error_min = -1.0 //0.005,
        bibcode = "" //""
    }
    
    func printInfo() -> String? {
        let unwrap = Unwraping()
        let text = """
        \tValue: \(unwrap.unwrapDouble(value: value))
        \tUnit: \(unwrap.unwrapString(value: unit))
        \tError Max: \(unwrap.unwrapDouble(value: error_max))
        \tError Min: \(unwrap.unwrapDouble(value: error_min))
        \tBibcode: \(unwrap.unwrapString(value: bibcode))
        """
        return text
    }

}

struct Planet : Decodable {
    let name: String?
    let coordinates: Coordinates?
    let mass: Mass?
    let radius: Radius? //null,
    let inclination: Inclination? //null,
    let semi_major_axis: Semi_Major_Axis?
    let orbital_period: Orbital_Period?
    let eccentricity: Eccentricity?
    let omega_angle: Inclination?
    let anomaly_angle: Inclination? //null,
    let lambda_angle: Inclination? //null,
    let time_periastron: Time_periastron?
    let time_conjonction: Time_periastron? //null,
    let angular_distance: Inclination? //null,
    let tzero_primary_transit: Time_periastron? //null,
    let tzero_secondary_transit: Time_periastron? //null,
    let impact_parameter: Inclination? //null,
    let tzero_radial_velocity: Time_periastron? //null,
    let velocity_semiamplitude: Velocity_semiamplitude?
    let calculated_temperature: Calculated_temperature? //null,
    let measured_temperature: Calculated_temperature? //null,
    let hottest_point_longitude: Inclination? //null,
    let geometric_albedo: Geometric_albedo? //null,
    let surface_gravity: Surface_gravity? //null,
    let detection_method: String? //"Radial Velocity",
    let mass_detection_method: String? //"Radial Velocity",
    let radius_detection_method: String? //"Radial Velocity",
    let parent_star: String? //"11 Com"
    
    init () {
        name = ""
        coordinates = Coordinates()
        mass = Mass ()
        radius = Radius() //null,
        inclination = Inclination() //null,
        semi_major_axis = Semi_Major_Axis()
        orbital_period = Orbital_Period()
        eccentricity =  Eccentricity()
        omega_angle = Inclination()
        anomaly_angle = Inclination() //null,
        lambda_angle = Inclination() //null,
        time_periastron = Time_periastron()
        time_conjonction = Time_periastron() //null,
        angular_distance = Inclination() //null,
        tzero_primary_transit = Time_periastron() //null,
        tzero_secondary_transit = Time_periastron() //null,
        impact_parameter = Inclination() //null,
        tzero_radial_velocity = Time_periastron() //null,
        velocity_semiamplitude = Velocity_semiamplitude()
        calculated_temperature = Calculated_temperature() //null,
        measured_temperature = Calculated_temperature() //null,
        hottest_point_longitude = Inclination() //null,
        geometric_albedo = Geometric_albedo() //null,
        surface_gravity = Surface_gravity() //null,
        detection_method = "" //"Radial Velocity",
        mass_detection_method = "" //"Radial Velocity",
        radius_detection_method = "" //"Radial Velocity",
        parent_star = ""//"11 Com"
    }
    
    func printInfo() -> String? {
        let unwrap = Unwraping()
        let text = """
        Name: \(unwrap.unwrapString(value: name))
        
        Coordinates:
        \(unwrap.unwrapString(value: self.coordinates?.printInfo()))
        
        Mass:
        \(unwrap.unwrapString(value: self.mass?.printInfo()))
        
        Radius:
        \(unwrap.unwrapString(value: self.radius?.printInfo()))
        
        Inclination:
        \(unwrap.unwrapString(value: self.inclination?.printInfo()))
        
        Semi Major Axis:
        \(unwrap.unwrapString(value: self.semi_major_axis?.printInfo()))
        
        Orbital Period:
        \(unwrap.unwrapString(value: self.orbital_period?.printInfo()))
        
        Eccentricity:
        \(unwrap.unwrapString(value: self.eccentricity?.printInfo()))
        
        Omega Angle:
        \(unwrap.unwrapString(value: self.omega_angle?.printInfo()))
        
        Calculated Temperature:
        \(unwrap.unwrapString(value: self.calculated_temperature?.printInfo()))
        
        Measured Temperature:
        \(unwrap.unwrapString(value: self.measured_temperature?.printInfo()))
        
        Surface Gravity:
        \(unwrap.unwrapString(value: self.surface_gravity?.printInfo()))
        
        Parent Star:  \(unwrap.unwrapString(value: self.parent_star))
        """
        return text
    }

}

struct Exoplanets : Decodable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Planet]?
    
    init () {
        count = -1
        next = "Initial Data"
        previous = "Initial Data"
        results = []
    }
}
