
 

package entity;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;

import org.apache.commons.io.IOUtils; 
import org.tensorflow.Graph;
import org.tensorflow.Session;
import org.tensorflow.Tensor;
 
public class Demol {
 
	public static void main() throws FileNotFoundException, IOException {
		// TODO Auto-generated method stub
		File file=new File("/mvn-ssh2/src/main/resources/encoder.pb");
		System.out.print(file.toString());
	}
}