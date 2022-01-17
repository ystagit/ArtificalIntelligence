package networks.activation;

class PerceptronFunction implements ActivationFunction {
    
    public function new() { }

	public function forward(x:Float):Float {
        return x > 0 ? 1 : 0;
    }
}