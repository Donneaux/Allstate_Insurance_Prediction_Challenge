import java.io.*;
import java.util.*;
import static java.util.Comparator.*;
import static java.util.stream.Collectors.*;
import static java.util.Arrays.*;

public class Main {
        public static void main(String[] args) throws IOException {
                try (BufferedReader in = new BufferedReader(new InputStreamReader(System.in))) {
                        in.readLine();
                        System.out.println("customer_ID,plan");
                        in.lines()
                                .map(s -> s.split(","))
                                .collect(
                                        groupingBy(
                                                a -> a[0],
                                                collectingAndThen(
                                                        maxBy(comparing(a -> a[1])),
                                                        Optional::get
                                                )
                                        )
                                ).values().stream()
                                .map(a -> a[0] + ',' + asList(a).subList(17,24).stream().collect(joining()))
                                .forEach(System.out::println);
                }
        }
}
