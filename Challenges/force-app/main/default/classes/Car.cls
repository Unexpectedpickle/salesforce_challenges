public class Car extends Vehicle {
    private static final Integer DEFAULT_VALUE = 0;

    private Integer SteeringRotation {get; 
        set {
            SteeringRotation = (value == null || value < -1440 || value > 1440) ? DEFAULT_VALUE : value;
        }
    }

    private Integer TireRotation {public get;
        set {
            TireRotation = (value == null || value < -90 || value > 90) ? DEFAULT_VALUE : value;
        }
    }

    private Integer Gear {public get; set;}

    public Car() {
        super();
        SteeringRotation = DEFAULT_VALUE;
        TireRotation = DEFAULT_VALUE;
        Media.set(Medium.LAND);
    }

    override private void Turn() {
        SteeringRotation = SteeringRotation + value;
        TireRotation = TireRotation + value/16;
    }

}
