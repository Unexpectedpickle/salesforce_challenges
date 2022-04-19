public class Calculator {
    public Calculator() {

    }

    public Integer Add(Integer a, Integer b) {
        System.debug(a+b);
        return a + b;
    }

    public Integer Multiply(Integer a, Integer b) {
        if (a == 0 || b == 0) {
            return 0;
        }
        Integer product = 0;
        for (Integer i = 0; i < b; i++) {
            product = Add(product, a);
        }
        System.debug(product);
        return product;
    }

    public Integer Divide(Integer a, Integer b) {
        if (b == 0 || a < b) {
            return 0;
        }
        Integer counter = 0, sum = 0;
        while(sum < a) {
            sum = Add(sum, b);
            if (sum == a) {
                counter++;
                break;
            }
            if (sum > a) {
                break;
            }
            counter++;
        }

        // while (sum > 0) {
        //     sum -= b;
        //     if (sum == 0) {
        //         counter++;
        //         break;
        //     }
        //     if (sum < 0) {
        //         break;
        //     }
        //     counter++;
        // }
        System.debug(counter);
        return counter;
    }

    public Integer Mod(Integer a, Integer b) {
        if (b > a) {
            return a;
        }
        Integer quotient = Divide(a, b);
        Integer product = Multiply(quotient, b);
        Integer difference = a - product;
        System.debug(difference);
        return difference;
    }

    public Integer calculate(String input) {
        List<String> split_string = input.split(' ');
        if (split_string.size() > 3) {
            return 0;
        }
        String operator = split_string.get(1);
        Integer first_num = Integer.valueOf(split_string.get(0));
        Integer second_num = Integer.valueOf(split_string.get(2));
        if (operator == '+') {
            return Add(first_num, second_num);
        } else if (operator == '*') {
            return Multiply(first_num, second_num);
        } else if (operator == '/') {
            return Divide(first_num, second_num);
        } else if (operator == '%') {
            return Mod(first_num, second_num);
        } else {
            return 0;
        }
    }
}