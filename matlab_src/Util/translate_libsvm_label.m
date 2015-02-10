function [out] = translate_libsvm_label(position, labels)
    out = 0;
    out = labels(position);
end