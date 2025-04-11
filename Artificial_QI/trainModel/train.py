import joblib
import pandas as pd
from sklearn.ensemble import RandomForestRegressor
import datasets
from sklearn.preprocessing import MinMaxScaler

ds = datasets.load_from_disk("assets/ds1")

train1 = pd.DataFrame(ds['train'])
train2 = pd.DataFrame(ds['test'])

scaler = MinMaxScaler(feature_range=(0, 1))

train_combined = pd.concat([train1, train2])

y_train = scaler.fit_transform(train_combined[['similarity_score']])
X_train = train_combined.drop(columns=['similarity_score'])

model = RandomForestRegressor(n_estimators=100, random_state=42)
model.fit(X_train, y_train.ravel())

joblib.dump(model, 'assets/newmodel.joblib')
diff = 0