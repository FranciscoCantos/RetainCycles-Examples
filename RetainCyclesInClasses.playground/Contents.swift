// Vehicle class with STRONG reference to car
class VehicleStrong {
    var carSTRONG: CarStrong?
    let id: String
    
    init(id: String, carSTRONG: CarStrong?) {
        self.carSTRONG = carSTRONG
        self.id = id
        
        print("Vehicle \(id) Allocated ✅")
    }
    
    deinit {
        print("Vehicle \(id) Deallocated ❌")
    }
}

// Car class with STRONG reference to vehicle
class CarStrong {
    var vehicleSTRONG: VehicleStrong?
    let id: String
    
    init(id: String, vehicleSTRONG: VehicleStrong?) {
        self.vehicleSTRONG = vehicleSTRONG
        self.id = id
        print("Car \(id) Allocated ✅")
    }
    
    deinit {
        print("Car \(id) Deallocated ❌")
    }
}

// We can see how the objects are allocated and deallocated properly.
var v1: VehicleStrong? = VehicleStrong(id: "1", carSTRONG: nil)
var c1: CarStrong? = CarStrong(id: "1", vehicleSTRONG: nil)

v1 = nil
c1 = nil

// We can see how the objects are allocated and not deallocated. There is a retain cycle.
var v2: VehicleStrong? = VehicleStrong(id: "2", carSTRONG: nil)
var c2: CarStrong? = CarStrong(id: "2", vehicleSTRONG: nil)

v2?.carSTRONG = c2
c2?.vehicleSTRONG = v2

v2 = nil
c2 = nil

//Change the STRONG references for WEAK references to avoid retain cycles.
// Vehicle class with STRONG reference to car
class VehicleWeak {
    weak var carWeak: CarWeak?
    let id: String
    
    init(id: String, carWeak: CarWeak?) {
        self.carWeak = carWeak
        self.id = id
        
        print("Vehicle \(id) Allocated ✅")
    }
    
    deinit {
        print("Vehicle \(id) Deallocated ❌")
    }
}

// Car class with STRONG reference to vehicle
class CarWeak {
    var vehicleWeak: VehicleWeak?
    let id: String
    
    init(id: String, vehicleWeak: VehicleWeak?) {
        self.vehicleWeak = vehicleWeak
        self.id = id
        print("Car \(id) Allocated ✅")
    }
    
    deinit {
        print("Car \(id) Deallocated ❌")
    }
}

// We can see how the objects are allocated and deallocated properly without a retain cycle using WEAK references.
var v3: VehicleWeak? = VehicleWeak(id: "3", carWeak: nil)
var c3: CarWeak? = CarWeak(id: "3", vehicleWeak: nil)

v3?.carWeak = c3
c3?.vehicleWeak = v3

v3 = nil
c3 = nil
