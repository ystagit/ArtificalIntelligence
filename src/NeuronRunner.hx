import networks.ConnectedNeuron;
import networks.InputNeuron;
import networks.ConnectedNeuronBuilder;
import networks.activation.PerceptronFunction;

/*
* Создаётся нейроная сеть с 3 входами и 1 выходом, то есть тут всего лишь 2 слоя, 
но название такое сети "полносвязная однослойная сеть". Сложилось так что входной слой 
не считают по этому вот такое название.
* Под выходом я имею ввиду -> ConnectedNeuron
* Перцептрон функция может выдавать результат двух видов 0 либо 1.
* Тренировка сети была сделана вручную. Здесь есть то, что мы знаем о факторах, влияющих на опыт:
* 1. Факт того, будет ли наш лучший друг на пляже или нет;
* 2. Наличие мяча;
* 3. Погода (солнечно или нет);

* Можно создать комбинацию всех этих факторов и желаемое поведение для каждого из них. 
Для примера я буду использовать 1, где будет обозначать присутствие фактора, а 0 – его отсутствие. 
Например, следующий массив отображает вход с информацией о том, что наш лучший друг будет на море, 
но не будет мяча и погода будет не солнечная, в следствии чего мы не пойдем на море:
[1, 0, 0] => 0 => I'm sitting at home!

* Еще один пример с информацией об отсутствии лучшего на море, но будет мяч и солнечная погода на улице 
– нужно идти на вечеринку.
* [0, 1, 1] => 1 => I'm going to the sea!

*/

class NeuronRunner {

	private final inputFriend:InputNeuron;
	private final inputBall:InputNeuron;
	private final inputSunny:InputNeuron;
	private var outputNeuron:ConnectedNeuron;

	static function main() {
		final runner:NeuronRunner = new NeuronRunner();
		runner.run();
	}

	public function new() {
		inputFriend = new InputNeuron();
		inputBall = new InputNeuron();
		inputSunny = new InputNeuron();
	}

	public function run() {
		initOutputNeuronWithWeight(1, 1, 1, -1);
		inputFriend.forwardSignalReceived(null, 1);
		inputBall.forwardSignalReceived(null, 1);
		inputSunny.forwardSignalReceived(null, 1);
		print();

		inputFriend.forwardSignalReceived(null, 1);
		inputBall.forwardSignalReceived(null, 0);
		inputSunny.forwardSignalReceived(null, 0);
		print();

		inputFriend.forwardSignalReceived(null, 1);
		inputBall.forwardSignalReceived(null, 1);
		inputSunny.forwardSignalReceived(null, 0);
		print();
	}

	private function initOutputNeuronWithWeight(wFriend:Float, wBall:Float, wWater:Float, bias:Float):Void {
		final builder:ConnectedNeuronBuilder = new ConnectedNeuronBuilder();
		outputNeuron = builder
		.withBias(bias)
		.withActivationFunction(new PerceptronFunction())
		.build();

		inputFriend.connect(outputNeuron, wFriend);
		inputBall.connect(outputNeuron, wBall);
		inputSunny.connect(outputNeuron, wWater);
	}

	private function print() {
		
		if (outputNeuron.forwarResult == 1) {
			trace("I'm going to the sea!");
		} else {
			trace("I'm sitting at home!");
		}
	}
}
