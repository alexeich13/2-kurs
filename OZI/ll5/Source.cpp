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
    cout << "Произведение:" << n << endl;
    cout << "Функция Эйлера: " << eiler << endl;
    cout << "Открытая экспонента: " << e << endl;
    d = power1(e, -1, eiler);
    cout << "Секретная экспонента: " << d << endl;
    cout << "Открытый ключ: {" << e << ", " << n << "}" << endl;
    cout << "Закрытый ключ: {" << d << ", " << n << "}" << endl << endl;
    cout << "Число для зашифровки: " << m1 << endl;
    c = power(m1, e, n);
    cout << "Шифротекст: " << c << endl;
    cout << "Расшифровка: " << power(c, d, n) << endl;
    s = power(m1, d, n); 
    m2 = power(s, e, n); 
    if (m1 == m2)
    {
        cout << "Подпись правильная!" << endl;
    }
    else
    {
        cout << "Подпись некорректная" << endl;
    }
}

int main() {
    setlocale(LC_ALL, "rus");
    RSA();
}