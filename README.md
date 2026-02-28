# Pre-trained Models

This directory contains the pre-trained machine learning models for Truth Lens.

## Model Files

| File | Size | Description |
|------|------|-------------|
| `xgb_model.pkl` | ~5.2 MB | XGBoost classifier (400 estimators) |
| `rf_model.pkl` | ~8.1 MB | Random Forest classifier (300 estimators) |
| `scaler.pkl` | ~12 KB | StandardScaler for feature normalization |
| `cov_matrix.pkl` | ~32 KB | Covariance matrix for OOD detection |

## Download Models

Models are not included in the repository due to file size. Download them using:

```bash
./download_models.sh
```

Or manually from [GitHub Releases](https://github.com/yourusername/truth-lens/releases).

## Model Details

### Training Dataset
- **Source**: ASVspoof 2019 Logical Access
- **Samples**: 3,200 total (1,600 real, 1,600 fake)
- **Split**: 80% training, 20% validation
- **Cross-validation**: 5-fold stratified

### Performance
- **Accuracy**: 94.2%
- **ROC-AUC**: 0.982
- **Precision**: 93.8%
- **Recall**: 94.6%
- **F1-Score**: 94.2%

### Model Specifications

#### XGBoost
```python
{
    'n_estimators': 400,
    'max_depth': 6,
    'learning_rate': 0.04,
    'subsample': 0.9,
    'colsample_bytree': 0.9,
    'objective': 'binary:logistic'
}
```

#### Random Forest
```python
{
    'n_estimators': 300,
    'max_depth': 12,
    'bootstrap': True,
    'max_features': 'sqrt'
}
```

## Verification

After downloading, verify file integrity:

```bash
ls -lh models/
# Should show all 4 .pkl files with correct sizes
```

## Retraining

To retrain models with your own data, see [docs/TRAINING.pdf](../docs/TRAINING.pdf).

## License

Models are licensed under MIT License. See [LICENSE](../LICENSE).
