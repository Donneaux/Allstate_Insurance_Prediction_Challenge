import java.io.*;
import java.util.stream.*;
import java.util.*;

public class Second {
        public static void main(String[] args) throws IOException {
                try (BufferedReader in = new BufferedReader(new InputStreamReader(System.in))) {
                        in.readLine();
                        System.out.println(in.lines()
                                .map(s -> s.split(","))
                                .map(a -> a[24])
                                .mapToInt(Integer::parseInt)
                                .max());
                }
        }
}
