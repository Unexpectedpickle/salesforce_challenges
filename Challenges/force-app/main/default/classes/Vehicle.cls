public abstract class Vehicle {
    public enum Medium { LAND, AIR, WATER }
    private static final Integer DEFAULT_SPEED = 0;
    private static final Integer DEFAULT_OCCUPANTS = 0;
    private static final String DEFAULT_NAME = 'Billy';
    private static final Integer DEFAULT_CAPACITY = 1;
    private static final String SEPARATOR = '|';

    private Integer speed {public get;
        set {
            speed = (value == null || value < 0) ? DEFAULT_SPEED : value;
         }
    }

    private String Name {public get; set;}

    private Integer Occupants {public get; 
        set{
            Occupants = (value == null || value < 0) ? DEFAULT_OCCUPANTS : value;
        }
    }

    private Integer Capacity {public get; 
        set {
            Capacity = (value == null || value < 1) ? DEFAULT_CAPACITY : value;
        }
    }

    protected List<Medium> Media {get; 
        protected set {
            Media.add(value);
        }
    }

    public Vehicle() {
        Vehicle(DEFAULT_SPEED, DEFAULT_OCCUPANTS, DEFAULT_NAME, DEFAULT_CAPACITY);
    }
    
    public Vehicle(Integer speed, Integer occupant, String name, Integer cap) {
        speed = speed;
        Occupants = occupant;
        Name = name;
        Capacity = cap;
    }

    public void Accelerate(Integer newSpeed) {
        speed = newSpeed == null || newSpeed < 0 ? DEFAULT_SPEED : newSpeed;
    }

    private abstract void Turn();

    public String ToString() {
        List<String> vehicle_info = new List<String>();
        vehicle_info.add(String.valueOf(speed));
        for (Integer i = 0; i < Medium.values().size(); i++) {
            vehicle_info.add(Medium.values()[i]);
        }
        vehicle_info.add(Name, String.valueOf(Occupants));
        return String.join(vehicle_info, SEPARATOR);
    }
}
