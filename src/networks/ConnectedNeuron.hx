package networks;

import networks.activation.ActivationFunction;
import haxe.ds.HashMap;

class ConnectedNeuron extends Neuron {

    private final forwardConnections:Array<Neuron> = new Array();

    private final backwardConnections:Map<Neuron, Float> = [];

    private final inputSignals:Map<Neuron, Float> = [];

    private var signalReceived:Int = 0;

    private final activationFunction:ActivationFunction;
    private final bias:Float;

    @:isVar public var forwarResult(get, null):Float;

    public function new(activationFunction:ActivationFunction, bias:Float) {
        this.activationFunction = activationFunction;
        this.bias = bias;
    }

    function get_forwarResult() {
        return forwarResult;
    }

    public function addForwardConnation(neuron:Neuron) {
        forwardConnections.push(neuron);
    }

	public function addBackwardConnation(neuron:Neuron, weight:Float) {
        backwardConnections[neuron] = weight;
        inputSignals[neuron] = 0;
    }

	public function forwardSignalReceived(neuron:Neuron, weight:Float) {
        signalReceived++;
        inputSignals[neuron] = weight;

        if (Lambda.count(backwardConnections) == signalReceived) {
            var forwardInputToActiveActivation:Float = 0;

            for (key in backwardConnections.keys()) {
                final weight = backwardConnections[key];
                forwardInputToActiveActivation += inputSignals[key] * weight;
            }

            forwardInputToActiveActivation += bias;

            final signalToSend:Float = activationFunction.forward(forwardInputToActiveActivation);
            forwarResult = signalToSend;

            for (connection in forwardConnections) {
                connection.forwardSignalReceived(this, signalToSend);
            }

            signalReceived = 0;
        }
    }

}