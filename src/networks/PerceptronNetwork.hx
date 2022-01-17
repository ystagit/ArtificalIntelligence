package networks;

/*import utils.Macro;
import haxe.ds.Vector;

class PerceptronNetwork {

    private final WEIGHT:Int = 1;
    private final BIAS:Int = 0;

    private final sizes: Array<Int>;
    private final numberOfLayers: Int;

    public function new(sizes: Array<Int>) {
        this.sizes = sizes;
        this.numberOfLayers = sizes.length;
    }

    public function feedForward(input: Vector<Int>):Vector<Int> {
        var output: Vector<Int> = null;

            for (n in 1...numberOfLayers) {
                final size:Int = sizes[n];
                output = Macro.createIntVector(size);
                final z = Macro.createIntVector(size);
                for (i in 0...size) {
                    for (j in 0...input.length) {
                        z[i] += input[j] * WEIGHT;
                    }
                    z[i] += BIAS;
                    output[i] = z[i] > 0 ? 1 : 0;
                }
            }

        return output;
    }

}*/