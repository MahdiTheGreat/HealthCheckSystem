# HealthCheckSystem

In this project, we design a health care system that receives different personal and vital characteristics from the user and by analyzing and checking them, announces different warnings to the user. Using the input information, this system measures health parameters including blood pressure, body temperature, occurrence of nervous shock or cardiac shock and shows the information related to each part in the output. In addition, if critical conditions (such as high blood pressure, fever, nervous and cardiac shock) occur, the system immediately informs the person about this issue. In this system, a person's personal information including age, body mass index, blood concentration and blood group type can be adjusted, which is effective in calculating vital signs.
This project is coded in verilog,and therefore it could be implemented with the help of an fpga,which costs less thant a microprocessor,and is a good fit for the prototyping state. Not that we are only allowed to use structural modeling, rather than behavorial modeling, except for the temperatureAnalyzer module.

#  Blood pressure circuit
## Parity bit redundancy
The blood pressure sensor adds an extra parity bit to the measured data due to the presence of noise. Therefore, the correctness of the data must be checked when receiving. If the input data to the system is valid, it should be checked that the input has not exceeded the threshold value. If the data is not valid, the output of the circuit that detects abnormal blood pressure will be ignored. We implement a circuit that can detect the error, which can be seen below:
![image](https://github.com/MahdiTheGreat/HealthCheckSystem/assets/47212121/b06470dc-1dea-4d13-97b0-b82ebcb37db7)


## Diagnosing abnormality of blood pressure
The blood pressure abnormality detection circuit has an unsigned 5-bit input (pressure value measured by the sensor). For a person, the blood pressure value in the range of 8 to 22 is normal and otherwise, the pressure is abnormal. 

# Blood pressure circuit
The health care system considers the warning if the problem input data is valid. In other words, if the received value is wrong due to imbalance, it should not be warned. The figure below shows the blood pressure circuit.

![image](https://github.com/MahdiTheGreat/HealthCheckSystem/assets/47212121/22cc2a94-6c4d-438a-8ebb-54f53595977a)

# Blood concentration circuit
## Blood separator circuit
The type of blood group affects the normality of blood pH concentration. Therefore, a blood group separating circuit must be designed first. The following table shows the code for each type of blood group:

![image](https://github.com/MahdiTheGreat/HealthCheckSystem/assets/47212121/a25f101d-ba58-4dba-b4ef-9fc026b10b63)

We design a circuit only with a 4 to 1 multiplexer so that if the person's blood type is O or B+, its output is equal to one, otherwise it is zero.

## Diagnostic circuit for the normality of blood PH concentration
For all blood groups, the concentration value of 7 and 8 is normal. For blood group O and B+, in addition to these values, the values 6 and 9 are also normal. Therefore, the system for detecting the normality of the pH concentration must decide according to the amount and type of blood group.
Design two functions related to abnormalityP and abnormalityQ to implement. AbnormalityP refers to the abnormality of blood PH concentration for non-O and B+ blood groups. AbnormalityQ refers to abnormal blood pH concentration for blood group O and B+. In this section, we will implement the following circuit:

![image](https://github.com/MahdiTheGreat/HealthCheckSystem/assets/47212121/164aeb67-9c8c-4ab2-8fc2-f4df59323926)

# Fall detection circuit
## Comparator circuit
In the health care system, there is a sensor that is used to detect a person falling, falling and losing balance. The output of this sensor is an unsigned 8-bit number. The control system must receive this value and compare it with an unsigned 8-bit number determined by the sensor manufacturer. If the sensor output is greater than or equal to the value specified by the factory, the system must recognize that the person has lost his balance and generate the desired warning. In this part, we implement the circuit in the figure below.

![image](https://github.com/MahdiTheGreat/HealthCheckSystem/assets/47212121/a60b1e53-8e3a-437f-b0a1-bb037102315f)

# Body temperature calculator circuit
## Body temperature calculation circuit
Suppose a thermometer is placed in a health care system. Communication with the thermometer is done through an analog to digital converter. In this system, first the body temperature is converted to the appropriate voltage value by the thermometer module. Then the voltage, which is a continuous and analog quantity, is converted into digital data using an analog-to-digital converter. The obtained data is a raw data and is not necessarily equal to the body temperature value and must be converted into a suitable data. The following relationship is used to convert the raw data (output of the analog to digital converter) to the expected data (body temperature):

![image](https://github.com/MahdiTheGreat/HealthCheckSystem/assets/47212121/c19bd572-2fb0-4ea1-9b31-fe28ecfceccd)

In this section, we implement the circuit in the figure below:

![image](https://github.com/MahdiTheGreat/HealthCheckSystem/assets/47212121/fd3410e4-5484-4b9f-b32e-2db5bb0b2c3f)

## Body temperature abnormality detection circuit
It is used to detect fever or abnormal body temperature. The Behavioural model of this circuit is in the temperatureAnalyzer module. The output of this circuit will be equal to zero when the body temperature is between 35 and 39 (including them). Otherwise, it will be equal to one in (Temperature Abnormality Detector), which is equivalent to abnormal body temperature.

# General circuit for detecting abnormality of body temperature
In this section, we implement the circuit in the figure below:

![image](https://github.com/MahdiTheGreat/HealthCheckSystem/assets/47212121/f57eb172-e235-4c5d-8206-2426f72b311b)

# Blood sugar detection circuit
The health care system has a sensor that measures the amount of blood sugar. The sensor output is an 8-bit number. The blood sugar calculator circuit consists of two parts. First, the absolute value of the 8-bit data is taken. Then the number of ones are counted and will be considered as the amount of blood sugar. The figure below shows an abstract state of the design that we implement:

![image](https://github.com/MahdiTheGreat/HealthCheckSystem/assets/47212121/fbe48f61-d6c5-435d-ac06-158d89b990c3)

# First phase
In this section, we will connect the circuits designed in the previous sections, as can be seen below:

![image](https://github.com/MahdiTheGreat/HealthCheckSystem/assets/47212121/71df5c95-45d3-4ceb-95cd-a0664ca4e753)

# Nervous shock detection circuit
The nervous shock detection circuit has a single-bit input and a clock, and according to the observed bit sequence, produces a two-bit output that identifies the type of nervous shock. The following table shows the desired bit sequence and its corresponding output:

![image](https://github.com/MahdiTheGreat/HealthCheckSystem/assets/47212121/7b25d9b7-0cf8-4b18-8984-4f06dadb3cbd)

We use a state machine to implement this section.

# Information storage circuit
The health care system is able to store personal information. The system is initially in the "idle" state (state A), the user must first enter the system into the "active" state by activating the request input (state B), then the system waits for the user to enter the 8 bit password and press the (confirm) button. If the password is correct, the system enters the "request" state (state C) and otherwise, the system goes to the "trap" state (state E)

If the system enters the "request" mode. It waits until the user enters an 8-bit data and selects the confirm button, so that on the active edge of the next clock, the system saves the information in the the corresponding registers (state D). In all this Steps if user input  set the request to zero, the system immediately goes to "idle" mode. If the highest value bit in the 8-bit data value is zero, the  data will be stored in the P register, otherwise, it will be stored in the Q register. The information stored in the P and Q registers is shown in the figure below:

![image](https://github.com/MahdiTheGreat/HealthCheckSystem/assets/47212121/68428393-39eb-4816-9e41-188894353472)

The whole circuit can be seen in the image below: 

![image](https://github.com/MahdiTheGreat/HealthCheckSystem/assets/47212121/65b4f44c-10ed-4b06-99fc-8e34613a8e37)

In which user means the user's input password, and password means the password that is already stored in the system. 

# The final phase
This section uses all the previously designed sections and informs the user of an appropriate warning. In the table below, all the inputs of the final control circuit are specified:

![Capture(1)](https://github.com/MahdiTheGreat/HealthCheckSystem/assets/47212121/72b41bdb-d121-43b7-a73c-0337ace0a58f)

This part of the project is actually a state machine that generates an alert by checking the person's profile. The output of the state machine is a 3-bit number that produces the appropriate warning message according to the following conditions:

- The output is actually the sum of the number of abnormal states. For example, if pressureAbnormality is equal to 1 and nervousShock is equal to 11, the final output for 3 will be 011.
- We consider the state number in the state machine to be equal to the number of abnormal states.
- We implement a Moore-based machine with a descriptive model.

To this project and generate circuit schematics, we use the Xilinx ISE Design Suite environment and test benches.


