package networks;

abstract class Neuron {

    public abstract function forwardSignalReceived(neuron:Neuron, weight:Float):Void;

    public function connect(neuron:Neuron, weight:Float):Void {
        this.addForwardConnation(neuron);
        neuron.addBackwardConnation(this, weight);
    }

    public abstract function addForwardConnation(neuron:Neuron):Void;

    public abstract function addBackwardConnation(neuron:Neuron, weight:Float):Void;

}