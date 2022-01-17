package networks;

class InputNeuron extends Neuron {
    
    private final connections:Array<Neuron> = new Array();

    public function new() { }

	public function addForwardConnation(neuron:Neuron) {
        connections.push(neuron);
    }

	public function addBackwardConnation(neuron:Neuron, weight:Float) {}

	public function forwardSignalReceived(neuron:Neuron, value:Float) {
        for (n in connections) {
            n.forwardSignalReceived(this, value);
        }
    }

}