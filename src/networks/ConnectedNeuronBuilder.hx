package networks;

import networks.activation.ActivationFunction;

class ConnectedNeuronBuilder {
    
    private var bias:Float = 1;

    private var activationFunction:ActivationFunction;

    public function new() { }

    public function withBias(bias:Float):ConnectedNeuronBuilder {
        this.bias = bias;
        return this;
    }

    public function withActivationFunction(activationFunction:ActivationFunction):ConnectedNeuronBuilder {
        this.activationFunction = activationFunction;
        return this;
    }

    public function build(): ConnectedNeuron {
        return new ConnectedNeuron(
            activationFunction,
            bias
        ); 
    }

}