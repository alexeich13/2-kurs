#include <iostream>
using namespace std;

int power(int a, int b, int n) { //a^b mod n
    int temp = a;
    int sum = temp;
    for (int i = 1; i < b; i++) {
        for (int j = 1; j < a; j++) {
            sum += temp;
            if (sum >= n) {
                sum -= n;
            }
        }
        temp = sum;
    }
    return temp;
}
int power1(int a, int b, int n) {
    int temp = a;
    int sum = temp;
    for (int i = 1; i > b; i--) {
        for (int j = 1; j < a; j++) {
            sum += temp;
            if (sum >= n) {
                sum -= n;
            }
        }
        temp = sum;
    }
    return temp;
}

void RSA()
{
    int p = 17, q = 5, eiler, e = 3, n, m1 = 10, m2, c, d, s;
    cout << "p = " << p << endl;
    cout << "q = " << q << endl;
    n = p * q;
    eiler = (p - 1) * (q - 1);
    cout << "������������:" << n << endl;
    cout << "������� ������: " << eiler << endl;
    cout << "�������� ����������: " << e << endl;
    d = power1(e, -1, eiler);
    cout << "��������� ����������: " << d << endl;
    cout << "�������� ����: {" << e << ", " << n << "}" << endl;
    cout << "�������� ����: {" << d << ", " << n << "}" << endl << endl;
    cout << "����� ��� ����������: " << m1 << endl;
    c = power(m1, e, n);
    cout << "����������: " << c << endl;
    cout << "�����������: " << power(c, d, n) << endl;
    s = power(m1, d, n); 
    m2 = power(s, e, n); 
    if (m1 == m2)
    {
        cout << "������� ����������!" << endl;
    }
    else
    {
        cout << "������� ������������" << endl;
    }
}

int main() {
    setlocale(LC_ALL, "rus");
    RSA();
}